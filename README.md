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
Updated: 2026-08-24T15:31:47.448633+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.748 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.679 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.918 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.735 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.782 |  |
| ap-southeast-5 | 0.845 |  |
| ap-southeast-6 | 0.774 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.141 | 18 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.450 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.512 |  |
| eu-south-1 | 0.467 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.376 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.115 | 5053 |
| us-east-2 | 0.115 | 1683 |
| us-gov-east-1 | 0.108 | 1879 |
| us-gov-west-1 | 0.248 | 227 |
| us-west-1 | 0.199 | 4045 |
| us-west-2 | 0.247 | 186 |

