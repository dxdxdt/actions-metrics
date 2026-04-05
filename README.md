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
Updated: 2026-04-05T15:25:02.280126+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.766 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.583 |  |
| ap-northeast-2 | 0.696 |  |
| ap-northeast-3 | 0.609 |  |
| ap-south-1 | 0.855 |  |
| ap-south-2 | 0.891 |  |
| ap-southeast-1 | 0.838 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.891 |  |
| ap-southeast-4 | 0.793 |  |
| ap-southeast-5 | 0.858 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.158 | 16 |
| ca-west-1 | 0.282 |  |
| eu-central-1 | 0.429 |  |
| eu-central-2 | 0.440 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.461 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.096 | 4441 |
| us-east-2 | 0.125 | 1483 |
| us-gov-east-1 | 0.124 | 1628 |
| us-gov-west-1 | 0.261 | 191 |
| us-west-1 | 0.217 | 3359 |
| us-west-2 | 0.264 | 153 |

