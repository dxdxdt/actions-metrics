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
Updated: 2026-07-11T11:48:41.363440+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.913 |  |
| ap-east-1 | 0.771 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.694 |  |
| ap-northeast-3 | 0.620 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.885 |  |
| ap-southeast-1 | 0.844 |  |
| ap-southeast-2 | 0.754 |  |
| ap-southeast-3 | 0.898 |  |
| ap-southeast-4 | 0.799 |  |
| ap-southeast-5 | 0.866 |  |
| ap-southeast-6 | 0.783 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.445 |  |
| eu-north-1 | 0.475 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.460 |  |
| eu-west-1 | 0.342 |  |
| eu-west-2 | 0.387 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.818 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.089 | 4848 |
| us-east-2 | 0.108 | 1656 |
| us-gov-east-1 | 0.106 | 1736 |
| us-gov-west-1 | 0.266 | 202 |
| us-west-1 | 0.226 | 3765 |
| us-west-2 | 0.274 | 165 |

