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
Updated: 2026-02-23T23:29:09.887334+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.688 |  |
| ap-northeast-1 | 0.574 |  |
| ap-northeast-2 | 0.681 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.914 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.825 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.883 |  |
| ap-southeast-4 | 0.778 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.927 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.213 |  |
| eu-central-1 | 0.446 |  |
| eu-central-2 | 0.484 |  |
| eu-north-1 | 0.493 |  |
| eu-south-1 | 0.487 |  |
| eu-south-2 | 0.484 |  |
| eu-west-1 | 0.370 |  |
| eu-west-2 | 0.404 |  |
| eu-west-3 | 0.431 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.840 |  |
| me-south-1 | 0.797 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.097 | 4173 |
| us-east-2 | 0.083 | 1373 |
| us-gov-east-1 | 0.082 | 1503 |
| us-gov-west-1 | 0.230 | 160 |
| us-west-1 | 0.242 | 3108 |
| us-west-2 | 0.234 | 130 |

