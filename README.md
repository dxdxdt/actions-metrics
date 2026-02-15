# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-15T09:24:47.452860+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.909 |  |
| ap-east-1 | 0.792 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.726 |  |
| ap-south-1 | 0.854 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.871 |  |
| ap-southeast-2 | 0.769 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.809 |  |
| ap-southeast-5 | 0.889 |  |
| ap-southeast-6 | 0.809 |  |
| ap-southeast-7 | 0.969 |  |
| ca-central-1 | 0.126 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.413 |  |
| eu-central-2 | 0.435 |  |
| eu-north-1 | 0.462 |  |
| eu-south-1 | 0.439 |  |
| eu-south-2 | 0.450 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.392 |  |
| il-central-1 | 0.591 |  |
| me-central-1 | 0.803 |  |
| me-south-1 | 0.770 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.518 |  |
| us-east-1 | 0.077 | 4124 |
| us-east-2 | 0.098 | 1342 |
| us-gov-east-1 | 0.099 | 1470 |
| us-gov-west-1 | 0.285 | 148 |
| us-west-1 | 0.245 | 3062 |
| us-west-2 | 0.284 | 125 |

