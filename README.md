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
Updated: 2026-03-14T21:20:02.347269+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.067 |  |
| ap-east-1 | 0.624 |  |
| ap-east-2 | 0.569 |  |
| ap-northeast-1 | 0.444 |  |
| ap-northeast-2 | 0.550 |  |
| ap-northeast-3 | 0.472 |  |
| ap-south-1 | 0.919 |  |
| ap-south-2 | 0.872 |  |
| ap-southeast-1 | 0.703 |  |
| ap-southeast-2 | 0.591 |  |
| ap-southeast-3 | 0.756 |  |
| ap-southeast-4 | 0.629 |  |
| ap-southeast-5 | 0.722 |  |
| ap-southeast-6 | 0.629 |  |
| ap-southeast-7 | 0.804 |  |
| ca-central-1 | 0.297 | 16 |
| ca-west-1 | 0.199 |  |
| eu-central-1 | 0.587 |  |
| eu-central-2 | 0.603 |  |
| eu-north-1 | 0.632 |  |
| eu-south-1 | 0.607 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.504 |  |
| eu-west-2 | 0.546 |  |
| eu-west-3 | 0.565 |  |
| il-central-1 | 0.776 |  |
| me-central-1 | 0.955 |  |
| me-south-1 | 0.924 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.690 |  |
| us-east-1 | 0.244 | 4279 |
| us-east-2 | 0.231 | 1422 |
| us-gov-east-1 | 0.227 | 1576 |
| us-gov-west-1 | 0.120 | 184 |
| us-west-1 | 0.064 | 3233 |
| us-west-2 | 0.121 | 146 |

