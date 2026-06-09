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
Updated: 2026-06-09T10:53:49.808103+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.037 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.604 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.599 |  |
| ap-northeast-3 | 0.510 |  |
| ap-south-1 | 0.932 |  |
| ap-south-2 | 0.913 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.636 |  |
| ap-southeast-3 | 0.796 |  |
| ap-southeast-4 | 0.674 |  |
| ap-southeast-5 | 0.764 |  |
| ap-southeast-6 | 0.670 |  |
| ap-southeast-7 | 0.837 |  |
| ca-central-1 | 0.263 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.574 |  |
| eu-south-1 | 0.577 |  |
| eu-south-2 | 0.569 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.504 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.698 |  |
| me-central-1 | 0.956 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.209 |  |
| sa-east-1 | 0.660 |  |
| us-east-1 | 0.216 | 4735 |
| us-east-2 | 0.180 | 1629 |
| us-gov-east-1 | 0.182 | 1709 |
| us-gov-west-1 | 0.155 | 198 |
| us-west-1 | 0.099 | 3652 |
| us-west-2 | 0.154 | 162 |

