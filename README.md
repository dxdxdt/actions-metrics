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
Updated: 2026-03-09T06:53:09.719244+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.049 |  |
| ap-east-1 | 0.647 |  |
| ap-east-2 | 0.592 |  |
| ap-northeast-1 | 0.471 |  |
| ap-northeast-2 | 0.580 |  |
| ap-northeast-3 | 0.496 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.868 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.615 |  |
| ap-southeast-3 | 0.783 |  |
| ap-southeast-4 | 0.642 |  |
| ap-southeast-5 | 0.739 |  |
| ap-southeast-6 | 0.660 |  |
| ap-southeast-7 | 0.823 |  |
| ca-central-1 | 0.273 | 16 |
| ca-west-1 | 0.183 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.583 |  |
| eu-north-1 | 0.612 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.601 |  |
| eu-west-1 | 0.492 |  |
| eu-west-2 | 0.529 |  |
| eu-west-3 | 0.564 |  |
| il-central-1 | 0.754 |  |
| me-central-1 | 0.954 |  |
| me-south-1 | 0.910 |  |
| mx-central-1 | 0.249 |  |
| sa-east-1 | 0.676 |  |
| us-east-1 | 0.247 | 4246 |
| us-east-2 | 0.217 | 1409 |
| us-gov-east-1 | 0.214 | 1546 |
| us-gov-west-1 | 0.132 | 176 |
| us-west-1 | 0.080 | 3199 |
| us-west-2 | 0.134 | 144 |

