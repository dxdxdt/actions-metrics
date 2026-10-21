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
Updated: 2026-10-21T05:35:49.914055+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.944 |  |
| ap-east-1 | 0.726 |  |
| ap-east-2 | 0.661 |  |
| ap-northeast-1 | 0.546 |  |
| ap-northeast-2 | 0.652 |  |
| ap-northeast-3 | 0.571 |  |
| ap-south-1 | 0.884 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.804 |  |
| ap-southeast-2 | 0.704 |  |
| ap-southeast-3 | 0.859 |  |
| ap-southeast-4 | 0.784 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.904 |  |
| ca-central-1 | 0.155 | 18 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.496 |  |
| eu-north-1 | 0.516 |  |
| eu-south-1 | 0.482 |  |
| eu-south-2 | 0.489 |  |
| eu-west-1 | 0.382 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.623 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.571 |  |
| us-east-1 | 0.127 | 5154 |
| us-east-2 | 0.131 | 1704 |
| us-gov-east-1 | 0.129 | 1951 |
| us-gov-west-1 | 0.228 | 239 |
| us-west-1 | 0.169 | 4182 |
| us-west-2 | 0.225 | 195 |

