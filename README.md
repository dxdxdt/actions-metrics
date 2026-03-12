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
Updated: 2026-03-12T04:07:58.588053+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.708 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.634 |  |
| ap-northeast-3 | 0.552 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.698 |  |
| ap-southeast-3 | 0.839 |  |
| ap-southeast-4 | 0.734 |  |
| ap-southeast-5 | 0.802 |  |
| ap-southeast-6 | 0.770 |  |
| ap-southeast-7 | 0.883 |  |
| ca-central-1 | 0.198 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.547 |  |
| eu-south-1 | 0.533 |  |
| eu-south-2 | 0.527 |  |
| eu-west-1 | 0.407 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.470 |  |
| il-central-1 | 0.652 |  |
| me-central-1 | 0.858 |  |
| me-south-1 | 0.835 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.604 |  |
| us-east-1 | 0.168 | 4261 |
| us-east-2 | 0.145 | 1419 |
| us-gov-east-1 | 0.147 | 1564 |
| us-gov-west-1 | 0.197 | 180 |
| us-west-1 | 0.168 | 3213 |
| us-west-2 | 0.207 | 144 |

