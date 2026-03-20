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
Updated: 2026-03-20T14:39:59.418451+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.754 |  |
| ap-east-2 | 0.701 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.697 |  |
| ap-northeast-3 | 0.599 |  |
| ap-south-1 | 0.861 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.836 |  |
| ap-southeast-2 | 0.744 |  |
| ap-southeast-3 | 0.890 |  |
| ap-southeast-4 | 0.804 |  |
| ap-southeast-5 | 0.859 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.160 | 16 |
| ca-west-1 | 0.261 |  |
| eu-central-1 | 0.438 |  |
| eu-central-2 | 0.457 |  |
| eu-north-1 | 0.497 |  |
| eu-south-1 | 0.471 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.397 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.615 |  |
| me-central-1 | 0.821 |  |
| me-south-1 | 0.775 |  |
| mx-central-1 | 0.233 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.101 | 4315 |
| us-east-2 | 0.121 | 1439 |
| us-gov-east-1 | 0.122 | 1591 |
| us-gov-west-1 | 0.272 | 189 |
| us-west-1 | 0.228 | 3267 |
| us-west-2 | 0.264 | 148 |

