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
Updated: 2026-07-10T23:52:35.411482+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.720 |  |
| ap-east-2 | 0.662 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.643 |  |
| ap-northeast-3 | 0.565 |  |
| ap-south-1 | 0.912 |  |
| ap-south-2 | 0.951 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.707 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.754 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.898 |  |
| ca-central-1 | 0.182 | 16 |
| ca-west-1 | 0.252 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.506 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.455 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.860 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.589 |  |
| us-east-1 | 0.148 | 4846 |
| us-east-2 | 0.150 | 1656 |
| us-gov-east-1 | 0.123 | 1735 |
| us-gov-west-1 | 0.220 | 202 |
| us-west-1 | 0.168 | 3763 |
| us-west-2 | 0.222 | 164 |

