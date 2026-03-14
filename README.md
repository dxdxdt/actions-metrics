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
Updated: 2026-03-14T13:40:44.755682+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.698 |  |
| ap-east-2 | 0.634 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.623 |  |
| ap-northeast-3 | 0.540 |  |
| ap-south-1 | 0.885 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.660 |  |
| ap-southeast-3 | 0.820 |  |
| ap-southeast-4 | 0.696 |  |
| ap-southeast-5 | 0.788 |  |
| ap-southeast-6 | 0.741 |  |
| ap-southeast-7 | 0.873 |  |
| ca-central-1 | 0.234 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.519 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.557 |  |
| eu-south-2 | 0.567 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.510 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.865 |  |
| mx-central-1 | 0.263 |  |
| sa-east-1 | 0.627 |  |
| us-east-1 | 0.185 | 4279 |
| us-east-2 | 0.178 | 1422 |
| us-gov-east-1 | 0.173 | 1575 |
| us-gov-west-1 | 0.179 | 183 |
| us-west-1 | 0.139 | 3227 |
| us-west-2 | 0.182 | 146 |

