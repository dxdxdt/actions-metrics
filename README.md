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
Updated: 2026-06-16T22:49:58.969755+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.559 |  |
| ap-northeast-2 | 0.666 |  |
| ap-northeast-3 | 0.597 |  |
| ap-south-1 | 0.858 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.824 |  |
| ap-southeast-2 | 0.695 |  |
| ap-southeast-3 | 0.868 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.834 |  |
| ap-southeast-6 | 0.733 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.191 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.473 |  |
| eu-central-2 | 0.503 |  |
| eu-north-1 | 0.523 |  |
| eu-south-1 | 0.516 |  |
| eu-south-2 | 0.500 |  |
| eu-west-1 | 0.397 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.451 |  |
| il-central-1 | 0.633 |  |
| me-central-1 | 0.845 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.144 | 4763 |
| us-east-2 | 0.143 | 1634 |
| us-gov-east-1 | 0.158 | 1713 |
| us-gov-west-1 | 0.228 | 198 |
| us-west-1 | 0.165 | 3673 |
| us-west-2 | 0.229 | 163 |

