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
Updated: 2026-03-19T23:23:27.373808+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.056 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.590 |  |
| ap-northeast-1 | 0.468 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.494 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.720 |  |
| ap-southeast-2 | 0.607 |  |
| ap-southeast-3 | 0.772 |  |
| ap-southeast-4 | 0.650 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.653 |  |
| ap-southeast-7 | 0.823 |  |
| ca-central-1 | 0.292 | 16 |
| ca-west-1 | 0.173 |  |
| eu-central-1 | 0.566 |  |
| eu-central-2 | 0.596 |  |
| eu-north-1 | 0.625 |  |
| eu-south-1 | 0.592 |  |
| eu-south-2 | 0.615 |  |
| eu-west-1 | 0.503 |  |
| eu-west-2 | 0.545 |  |
| eu-west-3 | 0.556 |  |
| il-central-1 | 0.749 |  |
| me-central-1 | 0.948 |  |
| me-south-1 | 0.912 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.680 |  |
| us-east-1 | 0.232 | 4310 |
| us-east-2 | 0.224 | 1437 |
| us-gov-east-1 | 0.224 | 1590 |
| us-gov-west-1 | 0.125 | 189 |
| us-west-1 | 0.080 | 3263 |
| us-west-2 | 0.126 | 148 |

