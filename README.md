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
Updated: 2026-06-16T17:57:14.409859+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.990 |  |
| ap-east-1 | 0.696 |  |
| ap-east-2 | 0.631 |  |
| ap-northeast-1 | 0.513 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.542 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.768 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.825 |  |
| ap-southeast-4 | 0.696 |  |
| ap-southeast-5 | 0.784 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.869 |  |
| ca-central-1 | 0.248 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.529 |  |
| eu-central-2 | 0.542 |  |
| eu-north-1 | 0.556 |  |
| eu-south-1 | 0.552 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.473 |  |
| eu-west-3 | 0.492 |  |
| il-central-1 | 0.675 |  |
| me-central-1 | 0.909 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.240 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.199 | 4762 |
| us-east-2 | 0.179 | 1634 |
| us-gov-east-1 | 0.187 | 1713 |
| us-gov-west-1 | 0.183 | 198 |
| us-west-1 | 0.128 | 3672 |
| us-west-2 | 0.183 | 163 |

