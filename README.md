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
Updated: 2026-07-25T13:20:41.880137+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.058 |  |
| ap-east-1 | 0.645 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.495 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.605 |  |
| ap-southeast-3 | 0.776 |  |
| ap-southeast-4 | 0.644 |  |
| ap-southeast-5 | 0.738 |  |
| ap-southeast-6 | 0.635 |  |
| ap-southeast-7 | 0.822 |  |
| ca-central-1 | 0.286 | 16 |
| ca-west-1 | 0.182 |  |
| eu-central-1 | 0.580 |  |
| eu-central-2 | 0.596 |  |
| eu-north-1 | 0.613 |  |
| eu-south-1 | 0.603 |  |
| eu-south-2 | 0.615 |  |
| eu-west-1 | 0.498 |  |
| eu-west-2 | 0.534 |  |
| eu-west-3 | 0.562 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.964 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.254 |  |
| sa-east-1 | 0.695 |  |
| us-east-1 | 0.241 | 4906 |
| us-east-2 | 0.204 | 1664 |
| us-gov-east-1 | 0.209 | 1777 |
| us-gov-west-1 | 0.128 | 207 |
| us-west-1 | 0.072 | 3831 |
| us-west-2 | 0.128 | 170 |

