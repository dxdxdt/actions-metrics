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
Updated: 2026-08-18T16:21:35.201325+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.485 |  |
| ap-northeast-2 | 0.593 |  |
| ap-northeast-3 | 0.511 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.738 |  |
| ap-southeast-2 | 0.628 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.756 |  |
| ap-southeast-6 | 0.663 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.263 | 18 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.574 |  |
| eu-north-1 | 0.608 |  |
| eu-south-1 | 0.579 |  |
| eu-south-2 | 0.581 |  |
| eu-west-1 | 0.474 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.534 |  |
| il-central-1 | 0.708 |  |
| me-central-1 | 0.929 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.218 | 5018 |
| us-east-2 | 0.227 | 1680 |
| us-gov-east-1 | 0.211 | 1845 |
| us-gov-west-1 | 0.167 | 224 |
| us-west-1 | 0.097 | 3988 |
| us-west-2 | 0.168 | 182 |

