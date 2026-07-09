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
Updated: 2026-07-09T08:25:41.753808+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.903 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.717 |  |
| ap-northeast-1 | 0.594 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.625 |  |
| ap-south-1 | 0.881 |  |
| ap-south-2 | 0.946 |  |
| ap-southeast-1 | 0.845 |  |
| ap-southeast-2 | 0.749 |  |
| ap-southeast-3 | 0.900 |  |
| ap-southeast-4 | 0.796 |  |
| ap-southeast-5 | 0.867 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.125 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.427 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.476 |  |
| eu-south-1 | 0.457 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.382 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.534 |  |
| us-east-1 | 0.095 | 4838 |
| us-east-2 | 0.089 | 1656 |
| us-gov-east-1 | 0.082 | 1733 |
| us-gov-west-1 | 0.265 | 201 |
| us-west-1 | 0.216 | 3758 |
| us-west-2 | 0.271 | 164 |

