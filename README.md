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
Updated: 2026-05-15T13:47:35.263382+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.898 |  |
| ap-east-1 | 0.805 |  |
| ap-east-2 | 0.729 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.644 |  |
| ap-south-1 | 0.852 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.877 |  |
| ap-southeast-2 | 0.799 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.982 |  |
| ca-central-1 | 0.108 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.416 |  |
| eu-central-2 | 0.430 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.442 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.339 |  |
| eu-west-2 | 0.370 |  |
| eu-west-3 | 0.398 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.072 | 4640 |
| us-east-2 | 0.086 | 1594 |
| us-gov-east-1 | 0.081 | 1692 |
| us-gov-west-1 | 0.295 | 195 |
| us-west-1 | 0.235 | 3563 |
| us-west-2 | 0.282 | 158 |

