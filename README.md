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
Updated: 2026-05-02T21:33:57.155914+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.658 |  |
| ap-east-2 | 0.588 |  |
| ap-northeast-1 | 0.480 |  |
| ap-northeast-2 | 0.581 |  |
| ap-northeast-3 | 0.507 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.744 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.789 |  |
| ap-southeast-4 | 0.681 |  |
| ap-southeast-5 | 0.753 |  |
| ap-southeast-6 | 0.669 |  |
| ap-southeast-7 | 0.838 |  |
| ca-central-1 | 0.258 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.557 |  |
| eu-north-1 | 0.591 |  |
| eu-south-1 | 0.564 |  |
| eu-south-2 | 0.568 |  |
| eu-west-1 | 0.458 |  |
| eu-west-2 | 0.501 |  |
| eu-west-3 | 0.522 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.205 |  |
| sa-east-1 | 0.662 |  |
| us-east-1 | 0.211 | 4586 |
| us-east-2 | 0.177 | 1558 |
| us-gov-east-1 | 0.179 | 1670 |
| us-gov-west-1 | 0.163 | 194 |
| us-west-1 | 0.099 | 3522 |
| us-west-2 | 0.164 | 157 |

