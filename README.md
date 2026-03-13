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
Updated: 2026-03-13T14:38:18.661336+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.978 |  |
| ap-east-1 | 0.724 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.547 |  |
| ap-northeast-2 | 0.660 |  |
| ap-northeast-3 | 0.572 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.947 |  |
| ap-southeast-1 | 0.799 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.755 |  |
| ap-southeast-5 | 0.820 |  |
| ap-southeast-6 | 0.816 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.180 | 16 |
| ca-west-1 | 0.259 |  |
| eu-central-1 | 0.482 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.532 |  |
| eu-south-1 | 0.515 |  |
| eu-south-2 | 0.522 |  |
| eu-west-1 | 0.406 |  |
| eu-west-2 | 0.445 |  |
| eu-west-3 | 0.461 |  |
| il-central-1 | 0.674 |  |
| me-central-1 | 0.791 |  |
| me-south-1 | 0.815 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.583 |  |
| us-east-1 | 0.146 | 4276 |
| us-east-2 | 0.169 | 1422 |
| us-gov-east-1 | 0.138 | 1568 |
| us-gov-west-1 | 0.213 | 181 |
| us-west-1 | 0.201 | 3219 |
| us-west-2 | 0.219 | 146 |

