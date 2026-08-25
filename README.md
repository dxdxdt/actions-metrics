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
Updated: 2026-08-25T10:23:28.707854+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.684 |  |
| ap-northeast-1 | 0.563 |  |
| ap-northeast-2 | 0.663 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.962 |  |
| ap-southeast-1 | 0.814 |  |
| ap-southeast-2 | 0.719 |  |
| ap-southeast-3 | 0.874 |  |
| ap-southeast-4 | 0.760 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.746 |  |
| ap-southeast-7 | 0.920 |  |
| ca-central-1 | 0.155 | 18 |
| ca-west-1 | 0.271 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.486 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.484 |  |
| eu-south-2 | 0.503 |  |
| eu-west-1 | 0.388 |  |
| eu-west-2 | 0.427 |  |
| eu-west-3 | 0.443 |  |
| il-central-1 | 0.613 |  |
| me-central-1 | 0.814 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.198 |  |
| sa-east-1 | 0.557 |  |
| us-east-1 | 0.113 | 5060 |
| us-east-2 | 0.124 | 1684 |
| us-gov-east-1 | 0.129 | 1883 |
| us-gov-west-1 | 0.240 | 227 |
| us-west-1 | 0.183 | 4050 |
| us-west-2 | 0.239 | 187 |

