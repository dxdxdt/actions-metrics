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
Updated: 2026-02-11T17:53:58.444559+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.039 |  |
| ap-east-1 | 0.659 |  |
| ap-northeast-1 | 0.481 |  |
| ap-northeast-2 | 0.591 |  |
| ap-south-1 | 0.934 |  |
| ap-south-2 | 0.883 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.619 |  |
| ap-southeast-3 | 0.789 |  |
| ap-southeast-4 | 0.655 |  |
| ca-central-1 | 0.261 | 16 |
| ca-west-1 | 0.188 |  |
| eu-central-1 | 0.556 |  |
| eu-central-2 | 0.576 |  |
| eu-north-1 | 0.603 |  |
| eu-south-1 | 0.600 |  |
| eu-south-2 | 0.596 |  |
| eu-west-1 | 0.475 |  |
| eu-west-2 | 0.511 |  |
| eu-west-3 | 0.535 |  |
| il-central-1 | 0.747 |  |
| me-central-1 | 0.947 |  |
| me-south-1 | 0.910 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.218 | 4105 |
| us-east-2 | 0.206 | 1331 |
| us-gov-east-1 | 0.206 | 1452 |
| us-gov-west-1 | 0.146 | 143 |
| us-west-1 | 0.093 | 3041 |
| us-west-2 | 0.146 | 125 |

