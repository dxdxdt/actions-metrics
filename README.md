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
Updated: 2026-09-05T05:07:24.881671+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.020 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.599 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.583 |  |
| ap-northeast-3 | 0.508 |  |
| ap-south-1 | 0.949 |  |
| ap-south-2 | 0.959 |  |
| ap-southeast-1 | 0.758 |  |
| ap-southeast-2 | 0.645 |  |
| ap-southeast-3 | 0.794 |  |
| ap-southeast-4 | 0.685 |  |
| ap-southeast-5 | 0.757 |  |
| ap-southeast-6 | 0.680 |  |
| ap-southeast-7 | 0.843 |  |
| ca-central-1 | 0.248 | 18 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.534 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.585 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.454 |  |
| eu-west-2 | 0.496 |  |
| eu-west-3 | 0.518 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.188 |  |
| sa-east-1 | 0.639 |  |
| us-east-1 | 0.197 | 5084 |
| us-east-2 | 0.204 | 1685 |
| us-gov-east-1 | 0.188 | 1895 |
| us-gov-west-1 | 0.163 | 231 |
| us-west-1 | 0.104 | 4082 |
| us-west-2 | 0.161 | 192 |

