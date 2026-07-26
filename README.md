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
Updated: 2026-07-26T18:02:57.510700+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.056 |  |
| ap-east-1 | 0.635 |  |
| ap-east-2 | 0.579 |  |
| ap-northeast-1 | 0.459 |  |
| ap-northeast-2 | 0.565 |  |
| ap-northeast-3 | 0.484 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.886 |  |
| ap-southeast-1 | 0.712 |  |
| ap-southeast-2 | 0.594 |  |
| ap-southeast-3 | 0.766 |  |
| ap-southeast-4 | 0.635 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.639 |  |
| ap-southeast-7 | 0.817 |  |
| ca-central-1 | 0.297 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.576 |  |
| eu-central-2 | 0.616 |  |
| eu-north-1 | 0.631 |  |
| eu-south-1 | 0.613 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.499 |  |
| eu-west-2 | 0.540 |  |
| eu-west-3 | 0.556 |  |
| il-central-1 | 0.746 |  |
| me-central-1 | 0.945 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.687 |  |
| us-east-1 | 0.245 | 4913 |
| us-east-2 | 0.219 | 1665 |
| us-gov-east-1 | 0.221 | 1779 |
| us-gov-west-1 | 0.121 | 207 |
| us-west-1 | 0.064 | 3840 |
| us-west-2 | 0.121 | 170 |

