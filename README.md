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
Updated: 2026-07-30T20:58:35.765736+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.964 |  |
| ap-east-1 | 0.735 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.583 |  |
| ap-south-1 | 0.873 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.808 |  |
| ap-southeast-2 | 0.718 |  |
| ap-southeast-3 | 0.864 |  |
| ap-southeast-4 | 0.761 |  |
| ap-southeast-5 | 0.828 |  |
| ap-southeast-6 | 0.745 |  |
| ap-southeast-7 | 0.914 |  |
| ca-central-1 | 0.156 | 17 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.471 |  |
| eu-central-2 | 0.494 |  |
| eu-north-1 | 0.518 |  |
| eu-south-1 | 0.495 |  |
| eu-south-2 | 0.515 |  |
| eu-west-1 | 0.404 |  |
| eu-west-2 | 0.443 |  |
| eu-west-3 | 0.458 |  |
| il-central-1 | 0.631 |  |
| me-central-1 | 0.872 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.584 |  |
| us-east-1 | 0.123 | 4923 |
| us-east-2 | 0.127 | 1672 |
| us-gov-east-1 | 0.099 | 1788 |
| us-gov-west-1 | 0.229 | 208 |
| us-west-1 | 0.185 | 3856 |
| us-west-2 | 0.229 | 172 |

