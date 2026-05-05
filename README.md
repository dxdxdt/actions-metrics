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
Updated: 2026-05-05T13:20:14.300742+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.558 |  |
| ap-northeast-2 | 0.661 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.869 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.742 |  |
| ap-southeast-3 | 0.876 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.767 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.186 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.481 |  |
| eu-north-1 | 0.527 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.384 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.848 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.133 | 4598 |
| us-east-2 | 0.140 | 1566 |
| us-gov-east-1 | 0.145 | 1673 |
| us-gov-west-1 | 0.243 | 194 |
| us-west-1 | 0.192 | 3535 |
| us-west-2 | 0.242 | 157 |

