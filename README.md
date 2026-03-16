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
Updated: 2026-03-16T12:53:37.024050+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.018 |  |
| ap-east-1 | 0.669 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.493 |  |
| ap-northeast-2 | 0.607 |  |
| ap-northeast-3 | 0.519 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.715 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.719 |  |
| ap-southeast-7 | 0.849 |  |
| ca-central-1 | 0.230 | 16 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.527 |  |
| eu-central-2 | 0.550 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.570 |  |
| eu-west-1 | 0.459 |  |
| eu-west-2 | 0.486 |  |
| eu-west-3 | 0.509 |  |
| il-central-1 | 0.715 |  |
| me-central-1 | 0.894 |  |
| me-south-1 | 0.857 |  |
| mx-central-1 | 0.288 |  |
| sa-east-1 | 0.636 |  |
| us-east-1 | 0.188 | 4289 |
| us-east-2 | 0.182 | 1429 |
| us-gov-east-1 | 0.184 | 1577 |
| us-gov-west-1 | 0.162 | 186 |
| us-west-1 | 0.163 | 3241 |
| us-west-2 | 0.158 | 148 |

