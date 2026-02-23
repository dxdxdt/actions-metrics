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
Updated: 2026-02-23T07:12:43.293651+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.031 |  |
| ap-east-1 | 0.659 |  |
| ap-east-2 | 0.600 |  |
| ap-northeast-1 | 0.481 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.879 |  |
| ap-south-2 | 0.855 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.625 |  |
| ap-southeast-3 | 0.791 |  |
| ap-southeast-4 | 0.664 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.664 |  |
| ap-southeast-7 | 0.839 |  |
| ca-central-1 | 0.270 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.543 |  |
| eu-central-2 | 0.586 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.569 |  |
| eu-south-2 | 0.580 |  |
| eu-west-1 | 0.470 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.523 |  |
| il-central-1 | 0.743 |  |
| me-central-1 | 0.950 |  |
| me-south-1 | 0.914 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.215 | 4169 |
| us-east-2 | 0.206 | 1371 |
| us-gov-east-1 | 0.206 | 1501 |
| us-gov-west-1 | 0.149 | 160 |
| us-west-1 | 0.099 | 3101 |
| us-west-2 | 0.153 | 130 |

