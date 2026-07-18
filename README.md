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
Updated: 2026-07-18T22:40:51.452661+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.887 |  |
| ap-east-1 | 0.782 |  |
| ap-east-2 | 0.726 |  |
| ap-northeast-1 | 0.611 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.767 |  |
| ap-southeast-3 | 0.927 |  |
| ap-southeast-4 | 0.817 |  |
| ap-southeast-5 | 0.885 |  |
| ap-southeast-6 | 0.805 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.270 |  |
| eu-central-1 | 0.406 |  |
| eu-central-2 | 0.431 |  |
| eu-north-1 | 0.446 |  |
| eu-south-1 | 0.422 |  |
| eu-south-2 | 0.448 |  |
| eu-west-1 | 0.331 |  |
| eu-west-2 | 0.361 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.552 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.513 |  |
| us-east-1 | 0.070 | 4883 |
| us-east-2 | 0.082 | 1657 |
| us-gov-east-1 | 0.082 | 1769 |
| us-gov-west-1 | 0.286 | 203 |
| us-west-1 | 0.240 | 3799 |
| us-west-2 | 0.286 | 167 |

