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
Updated: 2026-08-10T16:44:55.446259+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.871 |  |
| ap-east-1 | 0.816 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.745 |  |
| ap-northeast-3 | 0.661 |  |
| ap-south-1 | 0.827 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.784 |  |
| ap-southeast-3 | 0.958 |  |
| ap-southeast-4 | 0.831 |  |
| ap-southeast-5 | 0.919 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.110 | 18 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.383 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.435 |  |
| eu-south-1 | 0.411 |  |
| eu-south-2 | 0.415 |  |
| eu-west-1 | 0.309 |  |
| eu-west-2 | 0.345 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.546 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.483 |  |
| us-east-1 | 0.054 | 4970 |
| us-east-2 | 0.080 | 1678 |
| us-gov-east-1 | 0.107 | 1816 |
| us-gov-west-1 | 0.318 | 216 |
| us-west-1 | 0.257 | 3916 |
| us-west-2 | 0.319 | 176 |

