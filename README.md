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
Updated: 2026-10-06T15:36:30.283366+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.023 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.472 |  |
| ap-northeast-2 | 0.579 |  |
| ap-northeast-3 | 0.502 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.905 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.620 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.659 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.686 |  |
| ap-southeast-7 | 0.839 |  |
| ca-central-1 | 0.255 | 18 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.552 |  |
| eu-north-1 | 0.600 |  |
| eu-south-1 | 0.565 |  |
| eu-south-2 | 0.546 |  |
| eu-west-1 | 0.460 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.695 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.658 |  |
| us-east-1 | 0.212 | 5138 |
| us-east-2 | 0.222 | 1690 |
| us-gov-east-1 | 0.197 | 1934 |
| us-gov-west-1 | 0.152 | 237 |
| us-west-1 | 0.091 | 4159 |
| us-west-2 | 0.154 | 193 |

