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
Updated: 2026-07-02T19:12:26.561110+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.952 |  |
| ap-east-1 | 0.753 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.601 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.817 |  |
| ap-southeast-2 | 0.702 |  |
| ap-southeast-3 | 0.866 |  |
| ap-southeast-4 | 0.752 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.467 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.498 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.387 |  |
| eu-west-2 | 0.423 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.632 |  |
| me-central-1 | 0.865 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.580 |  |
| us-east-1 | 0.143 | 4812 |
| us-east-2 | 0.153 | 1650 |
| us-gov-east-1 | 0.155 | 1727 |
| us-gov-west-1 | 0.241 | 200 |
| us-west-1 | 0.177 | 3729 |
| us-west-2 | 0.239 | 164 |

