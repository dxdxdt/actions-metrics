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
Updated: 2026-03-02T19:32:19.787706+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.653 |  |
| ap-east-2 | 0.595 |  |
| ap-northeast-1 | 0.477 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.501 |  |
| ap-south-1 | 0.945 |  |
| ap-south-2 | 0.926 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.748 |  |
| ap-southeast-6 | 0.715 |  |
| ap-southeast-7 | 0.835 |  |
| ca-central-1 | 0.257 | 16 |
| ca-west-1 | 0.219 |  |
| eu-central-1 | 0.555 |  |
| eu-central-2 | 0.568 |  |
| eu-north-1 | 0.605 |  |
| eu-south-1 | 0.595 |  |
| eu-south-2 | 0.596 |  |
| eu-west-1 | 0.490 |  |
| eu-west-2 | 0.522 |  |
| eu-west-3 | 0.532 |  |
| il-central-1 | 0.742 |  |
| me-central-1 | 0.916 |  |
| me-south-1 | 0.883 |  |
| mx-central-1 | 0.224 |  |
| sa-east-1 | 0.665 |  |
| us-east-1 | 0.205 | 4210 |
| us-east-2 | 0.211 | 1390 |
| us-gov-east-1 | 0.185 | 1522 |
| us-gov-west-1 | 0.140 | 168 |
| us-west-1 | 0.120 | 3161 |
| us-west-2 | 0.141 | 136 |

