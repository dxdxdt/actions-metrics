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
Updated: 2026-07-15T22:52:05.771025+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.074 |  |
| ap-east-1 | 0.639 |  |
| ap-east-2 | 0.580 |  |
| ap-northeast-1 | 0.461 |  |
| ap-northeast-2 | 0.570 |  |
| ap-northeast-3 | 0.485 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.599 |  |
| ap-southeast-3 | 0.774 |  |
| ap-southeast-4 | 0.642 |  |
| ap-southeast-5 | 0.744 |  |
| ap-southeast-6 | 0.660 |  |
| ap-southeast-7 | 0.826 |  |
| ca-central-1 | 0.301 | 16 |
| ca-west-1 | 0.203 |  |
| eu-central-1 | 0.577 |  |
| eu-central-2 | 0.605 |  |
| eu-north-1 | 0.630 |  |
| eu-south-1 | 0.606 |  |
| eu-south-2 | 0.613 |  |
| eu-west-1 | 0.505 |  |
| eu-west-2 | 0.541 |  |
| eu-west-3 | 0.551 |  |
| il-central-1 | 0.730 |  |
| me-central-1 | 0.958 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.680 |  |
| us-east-1 | 0.238 | 4872 |
| us-east-2 | 0.254 | 1656 |
| us-gov-east-1 | 0.227 | 1754 |
| us-gov-west-1 | 0.137 | 202 |
| us-west-1 | 0.074 | 3784 |
| us-west-2 | 0.134 | 166 |

