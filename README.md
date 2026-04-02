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
Updated: 2026-04-02T10:44:48.079163+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.040 |  |
| ap-east-1 | 0.664 |  |
| ap-east-2 | 0.607 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.928 |  |
| ap-south-2 | 0.900 |  |
| ap-southeast-1 | 0.737 |  |
| ap-southeast-2 | 0.627 |  |
| ap-southeast-3 | 0.797 |  |
| ap-southeast-4 | 0.671 |  |
| ap-southeast-5 | 0.763 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.850 |  |
| ca-central-1 | 0.240 | 16 |
| ca-west-1 | 0.328 |  |
| eu-central-1 | 0.556 |  |
| eu-central-2 | 0.583 |  |
| eu-north-1 | 0.614 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.591 |  |
| eu-west-1 | 0.467 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.526 |  |
| il-central-1 | 0.727 |  |
| me-central-1 | 0.926 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.668 |  |
| us-east-1 | 0.206 | 4418 |
| us-east-2 | 0.182 | 1472 |
| us-gov-east-1 | 0.176 | 1621 |
| us-gov-west-1 | 0.150 | 190 |
| us-west-1 | 0.101 | 3336 |
| us-west-2 | 0.149 | 153 |

