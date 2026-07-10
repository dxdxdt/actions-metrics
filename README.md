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
Updated: 2026-07-10T16:17:21.892047+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.874 |  |
| ap-east-1 | 0.801 |  |
| ap-east-2 | 0.742 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.738 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.823 |  |
| ap-south-2 | 0.865 |  |
| ap-southeast-1 | 0.880 |  |
| ap-southeast-2 | 0.790 |  |
| ap-southeast-3 | 0.934 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.901 |  |
| ap-southeast-6 | 0.834 |  |
| ap-southeast-7 | 0.984 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.241 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.406 |  |
| eu-north-1 | 0.432 |  |
| eu-south-1 | 0.417 |  |
| eu-south-2 | 0.426 |  |
| eu-west-1 | 0.305 |  |
| eu-west-2 | 0.354 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.544 |  |
| me-central-1 | 0.773 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.494 |  |
| us-east-1 | 0.059 | 4845 |
| us-east-2 | 0.088 | 1656 |
| us-gov-east-1 | 0.105 | 1733 |
| us-gov-west-1 | 0.317 | 202 |
| us-west-1 | 0.274 | 3761 |
| us-west-2 | 0.317 | 164 |

